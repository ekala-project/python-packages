{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "markdown";
  version = "3.10.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Python-Markdown";
    repo = "markdown";
    tag = version;
    hash = "sha256-itRigH1234C6hwtGRon4AiDAKafscmhMn22V5J9WtvI=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "markdown" ];

  meta = {
    description = "Python implementation of John Gruber's Markdown";
    mainProgram = "markdown_py";
    homepage = "https://github.com/Python-Markdown/markdown";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
