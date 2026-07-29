{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  attrs,
  twisted,
  autobahn,
  treq,
  nixosTests,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "magic-wormhole-mailbox-server";
  version = "0.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "magic-wormhole";
    repo = "magic-wormhole-mailbox-server";
    tag = finalAttrs.version;
    hash = "sha256-P1Pyz4uOoFeTc7Fd8DxeHW/Cig8i2QS3wh6vOSzaDKg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    attrs
    autobahn
    twisted
  ]
  ++ autobahn.optional-dependencies.twisted
  ++ twisted.optional-dependencies.tls;

  pythonImportsCheck = [ "wormhole_mailbox_server" ];

  nativeCheckInputs = [
    pytestCheckHook
    treq
  ];

  disabledTestPaths = lib.optionals stdenv.hostPlatform.isDarwin [
    # these tests fail in Darwin's sandbox
    "src/wormhole_mailbox_server/test/test_web.py"
  ];

  meta = {
    description = "Securely transfer data between computers";
    homepage = "https://github.com/magic-wormhole/magic-wormhole-mailbox-server";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
