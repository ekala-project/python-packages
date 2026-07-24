{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  six,
  pyopenssl,
  pyspnego,
  namedlist,
  pydes,
  cryptography,
}:

buildPythonPackage rec {
  pname = "python-tds";
  version = "1.17.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "denisenkom";
    repo = "pytds";
    tag = version;
    hash = "sha256-W9Sk2X2bSMjtRu1XPnjWXOLjVVa+MYC7+ttrZc48c4I=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "version.get_git_version()" '"${version}"'
  '';
  build-system = [ setuptools ];

  dependencies = [ six ];
  pythonImportsCheck = [ "pytds" ];

  meta = {
    description = "Python DBAPI driver for MSSQL using pure Python TDS (Tabular Data Stream) protocol implementation";
    homepage = "https://python-tds.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
