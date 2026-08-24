{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  toolz,
  tornado,
  zict,
}:

buildPythonPackage (finalAttrs: {
  pname = "streamz";
  version = "0.6.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-streamz";
    repo = "streamz";
    tag = finalAttrs.version;
    hash = "sha256-m+kBRz3K5W5yuLRcamWCZ6j6A3MBT3HyjuCLzIzUqak=";
  };

  build-system = [ setuptools ];

  dependencies = [
    toolz
    tornado
    zict
  ];

  pythonImportsCheck = [ "streamz" ];

  meta = {
    description = "Pipelines to manage continuous streams of data";
    homepage = "https://github.com/python-streamz/streamz";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
