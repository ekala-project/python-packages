{
  lib,
  buildPythonPackage,
  fetchPypi,
  paramiko,
  mock,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "sshtunnel";
  version = "0.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-t2KJAeNKKXoadU0Tbl4SYs/e8cPgoZ91R0RX/7SdaDg=";
  };

  build-system = [ setuptools ];

  dependencies = [ paramiko ];
  # disable impure tests
  meta = {
    description = "Pure python SSH tunnels";
    mainProgram = "sshtunnel";
    homepage = "https://github.com/pahaz/sshtunnel";
    license = lib.licenses.mit;
  };
})
