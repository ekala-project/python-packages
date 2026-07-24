{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  mdurl,
}:

buildPythonPackage rec {
  pname = "markdown-it-py";
  version = "4.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "executablebooks";
    repo = "markdown-it-py";
    tag = "v${version}";
    hash = "sha256-S3xDPvnGqawsxAUcrMF/3a4jds6i+zfPLMpyvduaDpE=";
  };

  build-system = [
    flit-core
  ];

  dependencies = [ mdurl ];

  pythonImportsCheck = [ "markdown_it" ];

  meta = {
    description = "Markdown parser in Python";
    homepage = "https://markdown-it-py.readthedocs.io/";
    license = lib.licenses.mit;
    mainProgram = "markdown-it";
  };
}
