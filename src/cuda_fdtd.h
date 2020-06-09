#include <iostream>
#include <math.h>

using namespace std;

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
__device__
double GetElement(const array3d arr, int i_0,int i_1,int i_2)
{
  return arr.d_data[i_0*arr.size_1*arr.size_2 + i_1*arr.size_2 + i_2];
}
__device__ void SetElement(array3d arr, int i_0, int i_1, int i_2, double value)
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

    double e=GetElement(arr1,_i_ur_0,_i_ur_1,_i_ur_2);
    if(_i_ur_1+1<arr2.size_1)
      SetElement(arr2,_i_ur_0,_i_ur_1+1,_i_ur_2, 2*e);
    // SetElement(arr2,_i_ur_0,_i_ur_1,_i_ur_2, i);

  }
}

struct FDTD{
  array3d arr1;
  array3d arr2;
  FDTD(int s_0, int s_1, int s_2, double* arr1hostd, double* arr2hostd){
    // int N = 3;
    construct(arr1, arr1hostd, s_0,s_1,s_2);
    construct(arr2, arr2hostd, s_0,s_1,s_2);

    // initialize x and y arrays on the host
    // int val=0;
    // for (int i = 0; i < arr1.length; i++) {
      // arr1.h_data[i] = val++;
      // arr2.h_data[i] = 0.0f;
    // }
  }
  void run(){
    arr1.CopyToDevice();
    arr2.CopyToDevice();

    int blockSize=256;
    int numBlocks=(arr1.length+blockSize-1)/blockSize;
    cout << "numBlocks => " << numBlocks << endl;
    add<<<numBlocks, blockSize>>>(arr1, arr2);
    arr1.CopyToHost();
    arr2.CopyToHost();

    // Wait for GPU to finish before accessing on host
    // cout<<"arr1:"<<endl;
    // arr1.show();
    // cout<<"arr2:"<<endl;
    // arr2.show();
  }
  ~FDTD(){
    destruct(arr1);
    destruct(arr2);
  }
};
