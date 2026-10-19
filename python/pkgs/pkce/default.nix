{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pkce";
  version = "1.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "RomeoDespres";
    repo = "pkce";
    tag = finalAttrs.version;
    hash = "sha256-dOHCu0pDXk9LM4Yobaz8GAfVpBd8rXlty+Wfhx+WPME=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "pkce" ];

  meta = {
    description = "Python module to work with PKCE";
    homepage = "https://github.com/RomeoDespres/pkce";
    license = lib.licenses.mit;
  };
})
