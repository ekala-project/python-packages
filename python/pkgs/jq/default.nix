{
  lib,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  oniguruma,
  pkgs,
}:

let
  jq-c = pkgs.jq;
in
buildPythonPackage rec {
  pname = "jq";
  version = "1.12.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "mwilliamson";
    repo = "jq.py";
    tag = version;
    hash = "sha256-glWEqoS+QaoIiBJu9DXd+VvhPnWOgRT4VaYfMpjbR5g=";
  };

  env.JQPY_USE_SYSTEM_LIBS = 1;

  nativeBuildInputs = [ cython ];

  buildInputs = [
    jq-c
    oniguruma
  ];

  preBuild = ''
    cython jq.pyx
  '';

  pythonImportsCheck = [ "jq" ];

  meta = {
    description = "Python bindings for jq, the flexible JSON processor";
    homepage = "https://github.com/mwilliamson/jq.py";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}
