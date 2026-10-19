{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pyparsing,
}:

buildPythonPackage (finalAttrs: {
  pname = "dbus-signature-pyparsing";
  version = "0.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "stratis-storage";
    repo = "dbus-signature-pyparsing";
    tag = "v${finalAttrs.version}";
    hash = "sha256-+jY8kg3jBDpZr5doih3DiyUEcSskq7TgubmW3qdBoZM=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyparsing ];
  pythonImportsCheck = [ "dbus_signature_pyparsing" ];

  meta = {
    description = "Parser for a D-Bus Signature";
    homepage = "https://github.com/stratis-storage/dbus-signature-pyparsing";
    license = lib.licenses.asl20;
  };
})
