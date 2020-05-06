#include <Python.h>
#include <iostream>
#include <vector>
#include "numpy/arrayobject.h"
#include <complex>

using namespace std;


PyMODINIT_FUNC PyInit_mymodule(void)
{
  import_array();
}
template<class T>
PyObject* array_to_nparray(T* input, std::vector<int> shape_in, int type_num=PyArray_FLOAT)
{
    PyObject* shape;
    PyArrayObject* vec_array;
    PyObject* vec_array_reshaped;

    int c_array_length = 1;
    for(int s : shape_in)
      c_array_length *=s;

    // std::cout << "c_array_length" << " => " << c_array_length << std::endl;

    npy_intp array_length[1] = {c_array_length};
    vec_array = (PyArrayObject *) PyArray_SimpleNew(1, array_length, type_num);
    T *vec_array_pointer = (T*) PyArray_DATA(vec_array);

    for(int i=0; i < c_array_length; i++)
      vec_array_pointer[i] = input[i];

    // reshape numpy array
    shape = PyTuple_New(shape_in.size());

    for(int i=0; i < shape_in.size(); i++)
      PyTuple_SetItem(shape, i, PyLong_FromLong(shape_in[i]));

    vec_array_reshaped = PyArray_Reshape(vec_array, shape);

    return vec_array_reshaped;
}
class PythonInterp
{
  private:
  PyObject* pModule;
  PyObject* pName;

  public:
  PythonInterp(const char* environment, const char* script)
  {
    // debug
    // std::cout << "initi ptyhon" << std::endl;
    // std::cout << "environment" << " => " << environment << std::endl;
    // std::cout << "script" << " => " << script << std::endl;

    wchar_t* home_name = Py_DecodeLocale(environment, NULL);
    Py_SetPythonHome(home_name);
    Py_Initialize();

    // append current path to call the function in this directory
    PyRun_SimpleString("import sys");
    PyRun_SimpleString("sys.path.append(\".\")");

    pName = PyUnicode_DecodeFSDefault(script);
    pModule = PyImport_Import(pName);

    PyInit_mymodule();

  }
  ~PythonInterp()
  {
    // std::cout << "destructor called" << std::endl;
    Py_DECREF(pModule);
    Py_DECREF(pName);
  }
  template<class T>
  PyObject* call_function_np(const char* functionname, T* input, std::vector<int> shape_in, int type_num=PyArray_FLOAT)
  {
    PyObject* pValue;
    PyObject* pFunc;
    PyObject* pArgs;
    PyObject* vec_array_reshaped;
    PyArrayObject* vec_array;

    pFunc = PyObject_GetAttrString(pModule, functionname);
    if(!pFunc || !PyCallable_Check(pFunc))
      cout << "function: " << functionname << " not found!" << endl;

    pArgs = PyTuple_New(1);

    vec_array_reshaped = array_to_nparray(input, shape_in, type_num);
    PyTuple_SetItem(pArgs, 0, vec_array_reshaped);

    pValue = PyObject_CallObject(pFunc, pArgs);
    if(pValue == NULL)
      cout << "NULL value in " << pFunc << " python call!" << endl;

    // Py_DECREF(pValue);
    // Py_DECREF(pFunc);
    // Py_DECREF(pArgs);
    // Py_DECREF(shape);
    // Py_DECREF(vec_array_reshaped);

    return pValue;
  }
  template<class T>
  PyObject* call_function_np(const char* functionname, const char* stringarg, T* input, std::vector<int> shape_in, int type_num=PyArray_FLOAT)
  {
    PyObject* pValue;
    PyObject* pFunc;
    PyObject* pArgs;
    PyObject* _string_arg;
    PyObject* vec_array_reshaped;

    pFunc = PyObject_GetAttrString(pModule, functionname);
    if(!pFunc || !PyCallable_Check(pFunc))
      cout << "function: " << functionname << " not found!" << endl;

    pArgs = PyTuple_New(2);

    vec_array_reshaped = array_to_nparray(input, shape_in, type_num);
    PyTuple_SetItem(pArgs, 1, vec_array_reshaped);
    _string_arg = PyUnicode_DecodeFSDefault(stringarg);
    PyTuple_SetItem(pArgs, 0, _string_arg);

    pValue = PyObject_CallObject(pFunc, pArgs);
    if(pValue == NULL)
      cout << "NULL value in " << pFunc << " python call!" << endl;

    // Py_DECREF(pValue);
    // Py_DECREF(pFunc);
    // Py_DECREF(pArgs);
    // Py_DECREF(shape);
    // Py_DECREF(vec_array_reshaped);

    return pValue;
  }
  void call(const char* functionname)
  {
    PyObject* pValue;
    PyObject* pFunc;
    PyObject* pArgs;
    PyObject* shape;
    PyObject* vec_array_reshaped;
    PyArrayObject* vec_array;

    std::cout << "calling" << std::endl;
    pFunc = PyObject_GetAttrString(pModule, functionname);
    if(!pFunc || !PyCallable_Check(pFunc))
      cout << "function: " << functionname << " not found!" << endl;
    std::cout << "pFunc" << " => " << pFunc << std::endl;
    pArgs = PyTuple_New(1);
    PyTuple_SetItem(pArgs, 0, PyLong_FromLong(0));
    pValue = PyObject_CallObject(pFunc, pArgs);
    if(pValue == NULL)
      cout << "NULL value in " << pFunc << " python call!" << endl;

    // Py_DECREF(pValue);
    // Py_DECREF(pFunc);
    // Py_DECREF(pArgs);
    // Py_DECREF(shape);
    // Py_DECREF(vec_array_reshaped);

  }
  void call(const char* functionname, const char* stringarg)
  {
    PyObject* pValue;
    PyObject* pFunc;
    PyObject* pArgs;
    PyObject* shape;
    PyObject* vec_array_reshaped;
    PyObject* _string_arg;

    _string_arg = PyUnicode_DecodeFSDefault(stringarg);
    pFunc = PyObject_GetAttrString(pModule, functionname);
    if(!pFunc || !PyCallable_Check(pFunc))
      cout << "function: " << functionname << " not found!" << endl;
    pArgs = PyTuple_New(1);
    PyTuple_SetItem(pArgs, 0, _string_arg);
    pValue = PyObject_CallObject(pFunc, pArgs);
    if(pValue == NULL)
      cout << "NULL value in " << pFunc << " python call!" << endl;

    // Py_DECREF(pValue);
    // Py_DECREF(pFunc);
    // Py_DECREF(pArgs);
    // Py_DECREF(shape);
    // Py_DECREF(vec_array_reshaped);


  }
  PyObject* get(const char* functionname)
  {
    PyObject* pValue;
    PyObject* pFunc;
    PyObject* pArgs;
    PyObject* shape;
    PyObject* vec_array_reshaped;
    PyArrayObject* vec_array;

    // std::cout << "calling" << std::endl;
    pFunc = PyObject_GetAttrString(pModule, functionname);
    if(!pFunc || !PyCallable_Check(pFunc))
      cout << "function: " << functionname << " not found!" << endl;
    // std::cout << "pFunc" << " => " << pFunc << std::endl;
    pArgs = PyTuple_New(1);
    PyTuple_SetItem(pArgs, 0, PyLong_FromLong(0));
    pValue = PyObject_CallObject(pFunc, pArgs);
    if(pValue == NULL)
      cout << "NULL value in " << pFunc << " python call!" << endl;
    return pValue;

    // Py_DECREF(pValue);
    // Py_DECREF(pFunc);
    // Py_DECREF(pArgs);
    // Py_DECREF(shape);
    // Py_DECREF(vec_array_reshaped);

  }
  template<class T>
  void get_returned_numpy_arr(PyObject* output, T* data_out, vector<int>& size)
  {

    PyArrayObject* vec_array = (PyArrayObject *) output;
    T *vec_array_pointer = (T*) PyArray_DATA(vec_array);

    int arraysize = 1;
    for(int i=0; i<vec_array->nd; i++) {
      size.push_back(vec_array->dimensions[i]);
      arraysize *= vec_array->dimensions[i];
    }
    for(int i=0; i < arraysize; i++) {
      data_out[i] = vec_array_pointer[i];
    }
  }
};
