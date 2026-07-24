{
  lib,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  joserfc,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "authlib";
  version = "1.7.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lepture";
    repo = "authlib";
    tag = "v${finalAttrs.version}";
    hash = "sha256-FLSe9piZoFlOAutzoMcgygbsJsR8uSlZWqdNBU6D+aE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    joserfc
  ];

  pythonImportsCheck = [ "authlib" ];

  meta = {
    description = "Library for building OAuth and OpenID Connect servers";
    homepage = "https://github.com/lepture/authlib";
    license = lib.licenses.bsd3;
  };
})
