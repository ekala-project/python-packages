{
  lib,
  buildPythonPackage,
  fetchFromGitLab,
  # build-system
  setuptools,
  plum-py,
}:

buildPythonPackage rec {
  pname = "exif";
  version = "1.6.0";
  pyproject = true;

  src = fetchFromGitLab {
    owner = "TNThieding";
    repo = "exif";
    tag = "v${version}";
    hash = "sha256-uiHL3m0C6+YnAHRLwzMCSzffrQsSyVcuem6FBtTLxek=";
  };

  build-system = [ setuptools ];

  dependencies = [ plum-py ];

  pythonImportsCheck = [ "exif" ];

  meta = {
    description = "Read and modify image EXIF metadata using Python";
    homepage = "https://gitlab.com/TNThieding/exif";
    license = lib.licenses.mit;
  };
}
