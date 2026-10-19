{
  lib,
  buildPythonPackage,
  dill,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "multiprocess";
  version = "0.70.19";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "uqfoundation";
    repo = "multiprocess";
    tag = version;
    hash = "sha256-dH6SWecBxBQYqLohCg1gPWu6cQ7iKtRmIet9UlDMkWs=";
  };

  build-system = [ setuptools ];

  dependencies = [ dill ];

  # Python-version dependent tests

  pythonImportsCheck = [ "multiprocess" ];

  meta = {
    description = "Multiprocessing and multithreading in Python";
    homepage = "https://github.com/uqfoundation/multiprocess";
    license = lib.licenses.bsd3;
  };
}
