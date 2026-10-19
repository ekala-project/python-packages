{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "empty-files";
  version = "0.0.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "approvals";
    repo = "EmptyFiles.Python";
    tag = "v${version}";
    hash = "sha256-P/woyAN9cYdxryX1iM36C53c9dL6lo4eoTzBWT2cd3A=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # cyclic dependency with approvaltests

  pythonImportsCheck = [ "empty_files" ];

  meta = {
    description = "Null Object pattern for files";
    homepage = "https://github.com/approvals/EmptyFiles.Python";
    license = lib.licenses.asl20;
  };
}
