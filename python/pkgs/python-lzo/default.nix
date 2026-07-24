{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  lzo,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "python-lzo";
  version = "1.16";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jd-boyd";
    repo = "python-lzo";
    tag = "v${version}";
    hash = "sha256-iXAvOCzHPvNERMkE5y4QTHi4ZieW1wrYWYScs7zyb2c=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  buildInputs = [ lzo ];
  pythonImportsCheck = [ "lzo" ];

  meta = {
    description = "Python bindings for the LZO data compression library";
    homepage = "https://github.com/jd-boyd/python-lzo";
    license = lib.licenses.gpl2Only;
    maintainers = [ ];
  };
}
