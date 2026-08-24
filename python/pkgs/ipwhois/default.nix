{ lib
, buildPythonPackage
, defusedxml
, dnspython
, fetchFromGitHub
, setuptools
,
}:

buildPythonPackage rec {
  pname = "ipwhois";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "secynic";
    repo = "ipwhois";
    tag = "v${version}";
    hash = "sha256-PY3SUPELcCvS/o5kfko4OD1BlTc9DnyqfkSFuzcAOSY=";
  };

  pythonRelaxDeps = [ "dnspython" ];

  build-system = [ setuptools ];

  dependencies = [
    defusedxml
    dnspython
  ];

  pythonImportsCheck = [ "ipwhois" ];


  meta = {
    description = "Library to retrieve and parse whois data";
    homepage = "https://github.com/secynic/ipwhois";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}

