{
  lib,
  buildPythonPackage,
  click,
  fetchFromGitHub,
  packaging,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pythonfinder";
  version = "3.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sarugaku";
    repo = "pythonfinder";
    tag = finalAttrs.version;
    hash = "sha256-MX5o8KIMpZjUj93QwL54CDp6OjAnhw8TtuEGT8wkKtw=";
  };

  build-system = [ setuptools ];

  dependencies = [ packaging ];

  optional-dependencies = {
    cli = [ click ];
  };

  pythonImportsCheck = [ "pythonfinder" ];

  meta = {
    description = "Cross platform search tool for finding Python";
    homepage = "https://github.com/sarugaku/pythonfinder";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "pyfinder";
  };
})
