{ lib
, buildPythonPackage
, fetchFromGitHub
, flit-core
, # extras: babel
  babel
, flask-babel
, # extras: common
  argon2-cffi
, bcrypt
, bleach
, flask-mail
, # extras: fsqla
  flask-sqlalchemy
, sqlalchemy
, # extras: mfa
  cryptography
, phonenumberslite
, webauthn
, qrcode
, # propagates
  email-validator
, flask
, flask-login
, flask-principal
, flask-wtf
, libpass
, markupsafe
, wtforms
,
}:

buildPythonPackage rec {
  pname = "flask-security";
  version = "5.8.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pallets-eco";
    repo = "flask-security";
    tag = version;
    hash = "sha256-xNWgLIk/AB5beZQX7jzh8uQ9o0Gq+W5rgowBS215pk4=";
  };

  build-system = [ flit-core ];

  dependencies = [
    email-validator
    flask
    flask-login
    flask-principal
    flask-wtf
    markupsafe
    libpass
    wtforms
  ];

  optional-dependencies = {
    babel = [
      babel
      flask-babel
    ];
    common = [
      argon2-cffi
      bcrypt
      bleach
      flask-mail
    ];
    fsqla = [
      flask-sqlalchemy
      sqlalchemy
    ];
    mfa = [
      cryptography
      phonenumberslite
      webauthn
      qrcode
    ];
  };

  pythonImportsCheck = [ "flask_security" ];

  meta = {
    homepage = "https://github.com/pallets-eco/flask-security";
    description = "Quickly add security features to your Flask application";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
