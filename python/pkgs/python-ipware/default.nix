{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-ipware";
  version = "4.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "python_ipware";
    inherit (finalAttrs) version;
    hash = "sha256-/WECBY50wpEStDdviruucYhSyV+N5pZYAd6IypeA0i8=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "python_ipware" ];

  meta = {
    description = "Python package for server applications to retrieve client's IP address";
    homepage = "https://github.com/un33k/python-ipware";
    license = lib.licenses.mit;
  };
})
