#include <iostream>
#include <math.h>
#include<chrono>

using namespace std::chrono;
using namespace std;

struct Parameters{
  double Hc;
  double Jc;
  double Ec;
  double t;
  double tau; // duration of excitation
  double omega; // frequency of excitation
  double dt; // frequency of excitation
};

struct array3d{
  int size_0;
  int size_1;
  int size_2;
  int length;
  double* h_data;
  double* d_data;
  void CopyToHost(){
    cudaMemcpy(h_data,d_data,length*sizeof(double),cudaMemcpyDeviceToHost);
  }
  void CopyToDevice(){
    cudaMemcpy(d_data,h_data,length*sizeof(double),cudaMemcpyHostToDevice);
  }
  void show(){
    for(int _i0=0; _i0 < size_0; _i0++){
      // printing slice
      for(int _i1=0; _i1 < size_1; _i1++){
        for(int _i2=0; _i2 < size_2; _i2++){
          cout<<h_data[_i0*size_1*size_2 + _i1*size_2 + _i2]<<" ";
        }cout<<endl;
      }cout<<"------"<<endl;
    }
  }

};
struct Tensor{
  array3d x;
  array3d y;
  array3d z;
  void CopyToHost(){
    x.CopyToHost();
    y.CopyToHost();
    z.CopyToHost();
  }
  void CopyToDevice(){
    x.CopyToDevice();
    y.CopyToDevice();
    z.CopyToDevice();
  }
};
__device__
void unravel_index(const array3d &arr,const int raveled_index, int &i,int &j,int &k)
{
    i=raveled_index/(arr.size_1*arr.size_2);
    j=(raveled_index-(arr.size_1*arr.size_2*i))/(arr.size_2);
    k=raveled_index%arr.size_2;
}

void construct(array3d &arr, double*data, int size_0,int size_1, int size_2)
{
  arr.size_0=size_0;
  arr.size_1=size_1;
  arr.size_2=size_2;
  arr.length=size_0*size_1*size_2;
  // allocate memory on device
  cudaMalloc(&arr.d_data,arr.length*sizeof(double));
  // allocate memory on host
  // arr.h_data = new double[arr.length];
  arr.h_data = data;
}
void construct(Tensor& tensor, double*xdata,double*ydata,double*zdata,int size_0,int size_1, int size_2)
{
  construct(tensor.x, xdata, size_0,size_1,size_2);
  construct(tensor.y, ydata, size_0,size_1,size_2);
  construct(tensor.z, zdata, size_0,size_1,size_2);
}
void ToDevice(array3d &arr){
  cudaMemcpy(arr.d_data,arr.h_data,arr.length*sizeof(double),cudaMemcpyHostToDevice);
}
void ToHost(array3d &arr){
  cudaMemcpy(arr.h_data,arr.d_data,arr.length*sizeof(double),cudaMemcpyDeviceToHost);
}
void destruct(array3d &arr){
  delete [] arr.h_data;
  cudaFree(arr.d_data);
}
void destruct(Tensor& tensor)
{
  destruct(tensor.x);
  destruct(tensor.y);
  destruct(tensor.z);
}
__device__
double Get(const array3d arr, int i_0,int i_1,int i_2)
{
  return arr.d_data[i_0*arr.size_1*arr.size_2 + i_1*arr.size_2 + i_2];
}
__device__ void Set(array3d arr, int i_0, int i_1, int i_2, double value)
{
  arr.d_data[i_0*arr.size_1*arr.size_2 + i_1*arr.size_2 + i_2]=value;
}

__global__
void add(array3d arr1, array3d arr2)
{
  int index=blockIdx.x*blockDim.x+threadIdx.x;
  int stride=blockDim.x*gridDim.x;
  for(int i=index; i < arr1.length; i+=stride){

    // unravel index
    int _i_ur_0=i/(arr1.size_1*arr1.size_2);
    int _i_ur_1=(i-(arr1.size_1*arr1.size_2*_i_ur_0))/(arr1.size_2);
    int _i_ur_2=i%arr1.size_2;

    double e=Get(arr1,_i_ur_0,_i_ur_1,_i_ur_2);
    if(_i_ur_1+1<arr2.size_1)
      Set(arr2,_i_ur_0,_i_ur_1+1,_i_ur_2, 2*e);
    // Set(arr2,_i_ur_0,_i_ur_1,_i_ur_2, i);

  }
}
__global__
void timestepE(Tensor E, Tensor H, Tensor J, Parameters params)
{
  int index=blockIdx.x*blockDim.x+threadIdx.x;
  int stride=blockDim.x*gridDim.x;

  for(int thread_i=index; thread_i < E.x.length; thread_i+=stride){
    // unravel index
    int i,j,k;
    unravel_index(E.x,thread_i,i,j,k);

    if(i>0 && j>0 && k>0){
      if(i<E.x.size_0-1&&j<E.x.size_1-1&&k<E.x.size_2-1) {
        // index is distance of atleast 1 from outer edge
        double Ec=params.Ec; // constant value
        double Jc=params.Jc; // constant value

        // apply boundary condition
        double value;
        value=Get(E.x,i,j,k);
        value+=Ec*(Get(H.z,i,j,k)-Get(H.z,i,j-1,k));
        value-=Ec*(Get(H.y,i,j,k)-Get(H.y,i,j,k-1));
        Set(E.x,i,j,k,value);

        value=Get(E.y,i,j,k);
        value+=Ec*(Get(H.x,i,j,k)-Get(H.x,i,j,k-1));
        value-=Ec*(Get(H.z,i,j,k)-Get(H.z,i-1,j,k));
        Set(E.y,i,j,k,value);

        value=Get(E.z,i,j,k);
        value+=Ec*(Get(H.y,i,j,k)-Get(H.y,i-1,j,k));
        value-=Ec*(Get(H.x,i,j,k)-Get(H.x,i,j-1,k));
        Set(E.z,i,j,k,value);

        // source term
        value=Get(E.x,i,j,k);
        value-=Jc*Get(J.x,i,j,k)*exp(-params.t/params.tau)*cos(params.omega*params.t);
        Set(E.x,i,j,k,value);

        value=Get(E.y,i,j,k);
        value-=Jc*Get(J.y,i,j,k)*exp(-params.t/params.tau)*cos(params.omega*params.t);
        Set(E.y,i,j,k,value);

        value=Get(E.z,i,j,k);
        value-=Jc*Get(J.z,i,j,k)*exp(-params.t/params.tau)*cos(params.omega*params.t);
        Set(E.z,i,j,k,value);
        
      }
    }
  }
}
__global__
void timestepH(Tensor E, Tensor H, Tensor J, Parameters params)
{
  int index=blockIdx.x*blockDim.x+threadIdx.x;
  int stride=blockDim.x*gridDim.x;

  for(int thread_i=index; thread_i < E.x.length; thread_i+=stride){
    // unravel index
    int i,j,k;
    unravel_index(E.x,thread_i,i,j,k);

    if(i>0 && j>0 && k>0){
      if(i<E.x.size_0-1&&j<E.x.size_1-1&&k<E.x.size_2-1) {
        // index is distance of atleast 1 from outer edge
        double Hc=params.Hc; // constant value
        double value;
        value=Get(H.x,i,j,k);
        value+=Hc*(Get(E.y,i,j,k+1)-Get(E.y,i,j,k));
        value-=Hc*(Get(E.z,i,j+1,k)-Get(E.z,i,j,k));
        Set(H.x,i,j,k,value);

        value=Get(H.y,i,j,k);
        value+=Hc*(Get(E.z,i+1,j,k)-Get(E.z,i,j,k));
        value-=Hc*(Get(E.x,i,j,k+1)-Get(E.x,i,j,k));
        Set(H.y,i,j,k,value);

        value=Get(H.z,i,j,k);
        value+=Hc*(Get(E.x,i,j+1,k)-Get(E.x,i,j,k));
        value-=Hc*(Get(E.y,i+1,j,k)-Get(E.y,i,j,k));
        Set(H.z,i,j,k,value);
        
      }
    }
  }
}

struct FDTD{
  Tensor E;
  Tensor H;
  Tensor J;
  Parameters params;
  array3d arr2;
  FDTD(int s_0, int s_1, int s_2,
      double dx,double dt,double omega,double tau,
      double*Ex,double*Ey,double*Ez,
      double*Hx,double*Hy,double*Hz,
      double*Jx,double*Jy,double*Jz
      ){
    // int N = 3;
    construct(E,Ex,Ey,Ez,s_0,s_1,s_2);
    construct(H,Hx,Hy,Hz,s_0,s_1,s_2);
    construct(J,Jx,Jy,Jz,s_0,s_1,s_2);


    double mu0= 4*M_PI*1e-7;
    double eps0= 8.85e-12;

    params.Hc= (1/mu0)*(dt/dx);
    params.Ec= (1/eps0)*(dt/dx);
    params.Jc= (1/eps0)*dt;
    params.omega=omega;
    params.tau=tau;
    params.t=0;
    params.dt=dt;

    // initialize x and y arrays on the host
    // int val=0;
    // for (int i = 0; i < arr1.length; i++) {
      // arr1.h_data[i] = val++;
      // arr2.h_data[i] = 0.0f;
    // }
  }
  void run(int N){
    E.CopyToDevice();
    H.CopyToDevice();
    J.CopyToDevice();

    int blockSize=1024;
    int numBlocks=(E.x.length+blockSize-1)/blockSize;
    cout << "N => " << N << endl;
    // run N times
    for(int i=0; i < N; i++){
      auto start=high_resolution_clock::now();
      timestepE<<<numBlocks,blockSize>>>(E,H,J,params);
      timestepH<<<numBlocks,blockSize>>>(E,H,J,params);
      params.t+=params.dt;
      auto stop=high_resolution_clock::now();
      auto duration=duration_cast<microseconds>(stop-start);
      cout << "duration [ms] => " << duration.count() << endl;
    }

    // cout << "numBlocks => " << numBlocks << endl;
    // add<<<numBlocks, blockSize>>>(arr1, arr2);
    E.CopyToHost();
    H.CopyToHost();
    J.CopyToHost();

    // Wait for GPU to finish before accessing on host
    // cout<<"arr1:"<<endl;
    // arr1.show();
    // cout<<"arr2:"<<endl;
    // arr2.show();
  }
  void cleanup(){
    destruct(E);
    destruct(H);
    destruct(J);
  }
};
