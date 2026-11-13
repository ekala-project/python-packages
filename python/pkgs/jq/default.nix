{
  lib,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  # build-system
  setuptools,
  oniguruma,
  pkgs,
}:

let
  jq-c = pkgs.jq;
in
buildPythonPackage (finalAttrs: {
  pname = "jq";
  version = "1.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mwilliamson";
    repo = "jq.py";
    tag = finalAttrs.version;
    hash = "sha256-glWEqoS+QaoIiBJu9DXd+VvhPnWOgRT4VaYfMpjbR5g=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"cython==3.2.3"' '"cython"'
  '';

  build-system = [ setuptools ];

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
  };
})
