{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-ptrace";
  version = "0.9.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Vrv+9E6vOne+SBOMyldnzfRx6CeP4Umfm3LxUZB/Jc8=";
  };

  nativeBuildInputs = [ setuptools ];

  # requires distorm, which is optionally

  meta = {
    description = "Python binding of ptrace library";
    homepage = "https://github.com/vstinner/python-ptrace";
    license = lib.licenses.gpl2;
    maintainers = [ ];
  };
}
