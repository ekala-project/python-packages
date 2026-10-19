{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  matplotlib,
}:

buildPythonPackage rec {
  pname = "mpldatacursor";
  version = "0.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "joferkington";
    repo = "mpldatacursor";
    tag = "v${version}";
    sha256 = "0i1lwl6x6hgjq4xwsc138i4v5895lmnpfqwpzpnj5mlck6fy6rda";
  };

  build-system = [ setuptools ];

  dependencies = [ matplotlib ];

  # No tests included in archive

  pythonImportsCheck = [ "mpldatacursor" ];

  meta = {
    homepage = "https://github.com/joferkington/mpldatacursor";
    description = "Interactive data cursors for matplotlib";
    license = lib.licenses.mit;
  };
}
