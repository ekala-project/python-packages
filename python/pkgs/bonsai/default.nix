{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, cyrus_sasl
, openldap
, gevent
, tornado
, trio
,
}:

buildPythonPackage rec {
  pname = "bonsai";
  version = "1.5.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "noirello";
    repo = "bonsai";
    tag = "v${version}";
    hash = "sha256-q0BE1TuxiS01Z83dqDH54XzRgdF3ZszRBJsMIfsvTeU=";
  };

  build-system = [ setuptools ];

  buildInputs = [
    cyrus_sasl
    openldap
  ];

  optional-dependencies = {
    gevent = [ gevent ];
    tornado = [ tornado ];
    trio = [ trio ];
  };

  pythonImportsCheck = [ "bonsai" ];

  meta = {
    description = "Python 3 module for accessing LDAP directory servers";
    homepage = "https://github.com/noirello/bonsai";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
