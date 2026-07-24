{
  buildPythonPackage,
  fetchPypi,
  lib,
  python,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "protobuf";
  version = "7.35.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-zhFaJv4MOaLCmXPZFNMn5RamRVRkSJ/jzR5RobNU+Bo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [
    "google.protobuf"
    "google.protobuf.compiler"
    "google.protobuf.internal"
    "google.protobuf.pyext"
    "google.protobuf.testdata"
    "google.protobuf.util"
    "google._upb._message"
  ];

  # Tries to explicitly create a namespace package with pkg_resources,
  # which breaks everything with our PYTHONPATH setup.
  postInstall = ''
    rm $out/${python.sitePackages}/google/__init__.py
  '';

  meta = {
    description = "Protocol Buffers are Google's data interchange format";
    homepage = "https://developers.google.com/protocol-buffers/";
    license = lib.licenses.bsd3;
  };
})
