{
  stdenv,
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "multidict";
  version = "6.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "multidict";
    tag = "v${finalAttrs.version}";
    hash = "sha256-HOQRfSxf0+HeXsV4ShwfUDjNVyg2SjNuE157JLRlAL0=";
  };

  build-system = [ setuptools ];

  env = lib.optionalAttrs stdenv.cc.isClang {
    NIX_CFLAGS_COMPILE = "-Wno-error=unused-command-line-argument";
  };

  pythonImportsCheck = [ "multidict" ];

  meta = {
    description = "Multidict implementation";
    homepage = "https://github.com/aio-libs/multidict/";
    license = lib.licenses.asl20;
  };
})
