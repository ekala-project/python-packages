{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "identify";
  version = "2.6.19";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pre-commit";
    repo = "identify";
    tag = "v${finalAttrs.version}";
    hash = "sha256-YaPVRyJ0mKvtHPxLJZVVWlBkp4jXbjt21c3yNtn11p8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "identify" ];

  meta = {
    description = "File identification library for Python";
    homepage = "https://github.com/pre-commit/identify";
    license = lib.licenses.mit;
    mainProgram = "identify-cli";
  };
})
