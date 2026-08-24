{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  plumbum,
}:

buildPythonPackage rec {
  pname = "rpyc";
  version = "6.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tomerfiliba";
    repo = "rpyc";
    tag = version;
    hash = "sha256-KLAOt0FStHV0senU/I4chxgn3PPM59CGhjTr/5U0sa8=";
  };

  build-system = [ hatchling ];

  dependencies = [ plumbum ];

  pythonImportsCheck = [ "rpyc" ];

  doCheck = !stdenv.hostPlatform.isDarwin;

  meta = {
    description = "Remote Python Call (RPyC), a transparent and symmetric RPC library";
    homepage = "https://rpyc.readthedocs.org";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
