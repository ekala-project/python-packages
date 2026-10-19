{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-ipware";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_ipware";
    inherit (finalAttrs) version;
    hash = "sha256-kRexxN3ctdXKSeapYX3i/Gauwu81OUVjrE7sq99YwGI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "python_ipware" ];

  meta = {
    description = "Python package for server applications to retrieve client's IP address";
    homepage = "https://github.com/un33k/python-ipware";
    license = lib.licenses.mit;
  };
})
