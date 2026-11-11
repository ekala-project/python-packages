{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "beartype";
  version = "0.23.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "beartype";
    repo = "beartype";
    tag = "v${finalAttrs.version}";
    hash = "sha256-gg4mEJ1SZRkdsP/FtuGocCSNsvaYW9U1PWbLL6n5zi8=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "beartype" ];

  meta = {
    description = "Fast runtime type checking for Python";
    homepage = "https://github.com/beartype/beartype";
    license = lib.licenses.mit;
  };
})
