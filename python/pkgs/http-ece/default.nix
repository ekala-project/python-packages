{
  lib,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  setuptools,
  pytest-cov-stub,
}:

buildPythonPackage (finalAttrs: {
  pname = "http-ece";
  version = "1.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "web-push-libs";
    repo = "encrypted-content-encoding";
    tag = finalAttrs.version;
    hash = "sha256-HjXJWoOvCVOdEto4Ss4HPUuf+uNcQkfvj/cxJGHOhQ8=";
  };

  sourceRoot = "${src.name}/python";

  build-system = [ setuptools ];

  dependencies = [ cryptography ];
  meta = {
    description = "Encipher HTTP Messages";
    homepage = "https://github.com/web-push-libs/encrypted-content-encoding";
    license = lib.licenses.mit;
  };
})
