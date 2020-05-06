#include <complex>

template<class T>
class array1d{
  public:
    int size_0;
    T* data;
    array1d(int size_0_in)
    {
      data = new T[size_0_in];
      size_0 = size_0_in;
    }
    ~array1d()
    {
      delete [] data;
    }
    inline T operator() (int index_0) const {
      return data[index_0];
    }
    inline T& operator() (int index_0) {
      return data[index_0];
    }
};
template<class T>
class array2d{
  public:
    int size_0;
    int size_1;
    int length;
    T* data;
    array2d(int size_0_in, int size_1_in)
    {
      data = new T[size_0_in * size_1_in];
      size_0 = size_0_in;
      size_1 = size_1_in;
      length = size_1 * size_0;
    }
    ~array2d()
    {
      delete [] data;
    }
    inline T operator() (int index_0, int index_1) const {
      // cout << endl << "retrieving index_0:" << index_0 << " index_1:" << index_1 << endl;
      return data[index_0*size_1 + index_1];
    }
    inline T& operator() (int index_0, int index_1) {
      return data[index_0*size_1+ index_1];
    }
};
  template<class T>
  class array3d{
    public:
      int size_0;
      int size_1;
      int length;
      int size_2;
      T* data;
      array3d(int size_0_in, int size_1_in, int size_2_in)
      {
        data = new T[size_0_in * size_1_in * size_2_in];
        size_0 = size_0_in;
        size_1 = size_1_in;
        size_2 = size_2_in;
        length = size_2 * size_1 * size_0;
      }
      ~array3d()
      {
        delete [] data;
      }
      inline T operator() (int index_0, int index_1, int index_2) const {
        return data[index_0*size_1*size_2 + index_1*size_2+ index_2];
      }
      inline T& operator() (int index_0, int index_1, int index_2) {
        return data[index_0*size_1*size_2 + index_1*size_2+ index_2];
      }

  };
float max(const array2d<float> & arr)
{
  float max_val = -99999999;
  int length = arr.size_0*arr.size_1;
  for(int i=0; i<length; i++)
    if(arr.data[i] > max_val)
      max_val = arr.data[i];
  return max_val;
}

float max(const array2d<complex<float>> & arr)
{
  float max_val = -99999999;
  int length = arr.size_0*arr.size_1;
  for(int i=0; i<length; i++)
    if(abs(arr.data[i]) > max_val)
      max_val = abs(arr.data[i]);
  return max_val;
}
float min(const array2d<complex<float>> & arr)
{
  float min_val = 99999999;
  int length = arr.size_0*arr.size_1;
  for(int i=0; i<length; i++)
    if(abs(arr.data[i]) < min_val)
      min_val = abs(arr.data[i]);
  return min_val;
}
float min(const array2d<float> & arr)
{
  float min_val = 99999999;
  int length = arr.size_0*arr.size_1;
  for(int i=0; i<length; i++)
    if(arr.data[i] < min_val)
      min_val = arr.data[i];
  return min_val;
}
void normalize(const array2d<complex<float>> & arr)
{
  float maxval = max(arr);
  int length = arr.size_0*arr.size_1;
  for(int i=0; i< length; i++)
    arr.data[i] /= maxval;
}




void printarray(array1d<float> const & array_in)
{
  int longest_str_length = 0;
  for(int i=0; i < array_in.size_0; i++)
  {
    // find longest string in array
    string a = to_string(array_in(i));
    if(a.length() > longest_str_length)
    {
      longest_str_length = a.length();
    }
  }
  for(int i=0; i < array_in.size_0; i++)
  {
    // find longest string in array
    string a = to_string(array_in(i));
    if(a.length() < longest_str_length)
    {
      int lengthdiff = longest_str_length - a.length();
      for(int k=0; k < lengthdiff; k++)
      {
        a+= " ";
      }
    }
    cout << a << " ";
  }
  cout << endl;
}
void printarray(array2d<float> const & array_in)
{
  int longest_str_length = 0;
  for(int i=0; i < array_in.size_0; i++)
  {
    for(int j=0; j < array_in.size_1; j++)
    {
      // find longest string in array
      string a = to_string(array_in(i, j));
      if(a.length() > longest_str_length)
      {
        longest_str_length = a.length();
      }
    }
  }
  for(int i=0; i < array_in.size_0; i++)
  {
    for(int j=0; j < array_in.size_1; j++)
    {
      // find longest string in array
      string a = to_string(array_in(i, j));
      if(a.length() < longest_str_length)
      {
        int lengthdiff = longest_str_length - a.length();
        for(int k=0; k < lengthdiff; k++)
        {
          a+= " ";
        }
      }
      cout << a << " ";
    }
    cout << endl;
  }
}
void printarray(array2d<int> const & array_in)
{
  int longest_str_length = 0;
  for(int i=0; i < array_in.size_0; i++)
  {
    for(int j=0; j < array_in.size_1; j++)
    {
      // find longest string in array
      string a = to_string(array_in(i, j));
      if(a.length() > longest_str_length)
      {
        longest_str_length = a.length();
      }
    }
  }
  for(int i=0; i < array_in.size_0; i++)
  {
    for(int j=0; j < array_in.size_1; j++)
    {
      // find longest string in array
      string a = to_string(array_in(i, j));
      if(a.length() < longest_str_length)
      {
        int lengthdiff = longest_str_length - a.length();
        for(int k=0; k < lengthdiff; k++)
        {
          a+= " ";
        }
      }
      cout << a << " ";
    }
    cout << endl;
  }
}
void printarray(array2d<complex<float>> const & array_in)
{
  int longest_str_length = 0;
  for(int i=0; i < array_in.size_0; i++)
  {
    for(int j=0; j < array_in.size_1; j++)
    {
      // find longest string in array
      string a1 = to_string(array_in(i, j).real());
      string a2 = to_string(array_in(i, j).imag());
      string a = a1 + "+ " + a2 + "j";
      if(a.length() > longest_str_length)
      {
        longest_str_length = a.length();
      }
    }
  }
  for(int i=0; i < array_in.size_0; i++)
  {
    for(int j=0; j < array_in.size_1; j++)
    {
      // find longest string in array
      string a1 = to_string(array_in(i, j).real());
      string a2 = to_string(array_in(i, j).imag());
      string a = a1 + "+ " + a2 + "j";
      if(a.length() < longest_str_length)
      {
        int lengthdiff = longest_str_length - a.length();
        for(int k=0; k < lengthdiff; k++)
        {
          a+= " ";
        }
      }
      cout << a << " ";
    }
    cout << endl;
  }
}
