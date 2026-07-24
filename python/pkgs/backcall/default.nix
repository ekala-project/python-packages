{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage rec {
  pname = "backcall";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XL2/J75efPrbRIuvCqlVCPkfK7xsZDfNnNBuKkwhXh4=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "backcall" ];

  meta = {
    description = "Specifications for callback functions passed in to an API";
    homepage = "https://github.com/takluyver/backcall";
    license = lib.licenses.bsd3;
  };
}
