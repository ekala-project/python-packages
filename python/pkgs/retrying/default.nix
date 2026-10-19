{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "retrying";
  version = "1.4.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-0QLnXVPY0wuIVi1FNh1sbJNNoG+rMb2BwEIKy5eoujk=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "retrying" ];

  meta = {
    homepage = "https://github.com/rholder/retrying";
    description = "General-purpose retrying library";
    license = lib.licenses.asl20;
  };
})
