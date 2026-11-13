{
  lib,
  buildPythonPackage,
  fetchPypi,
  fonttools,
  gfmetadata,
  protobuf,
  pytestCheckHook,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "axisregistry";
  version = "0.4.20";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-y+x/EUp+LPVkviXKok3pg/mPxpzSiuYimIL27Xm4G28=";
  };

  env.PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION = "python";

  build-system = [ setuptools-scm ];

  dependencies = [
    fonttools
    gfmetadata
    protobuf
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "axisregistry" ];

  meta = {
    description = "Google Fonts registry of OpenType variation axis tags";
    homepage = "https://github.com/googlefonts/axisregistry";
    license = lib.licenses.asl20;
  };
})
