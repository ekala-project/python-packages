{
  lib,
  buildPythonPackage,
  fetchFromGitLab,
  plum-py,
}:

buildPythonPackage rec {
  pname = "exif";
  version = "1.6.0";
  format = "setuptools";

  src = fetchFromGitLab {
    owner = "TNThieding";
    repo = "exif";
    tag = "v${version}";
    hash = "sha256-uiHL3m0C6+YnAHRLwzMCSzffrQsSyVcuem6FBtTLxek=";
  };

  propagatedBuildInputs = [ plum-py ];

  pythonImportsCheck = [ "exif" ];

  meta = {
    description = "Read and modify image EXIF metadata using Python";
    homepage = "https://gitlab.com/TNThieding/exif";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
