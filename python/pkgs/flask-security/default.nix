{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  # extras: babel
  babel,
  flask-babel,
  # extras: common
  argon2-cffi,
  bcrypt,
  nh3,
  flask-mail,
  # extras: fsqla
  flask-sqlalchemy,
  sqlalchemy,
  # extras: mfa
  cryptography,
  phonenumberslite,
  webauthn,
  qrcode,
  # propagates
  email-validator,
  flask,
  flask-login,
  flask-principal,
  flask-wtf,
  libpass,
  markupsafe,
  wtforms,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-security";
  version = "5.9.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pallets-eco";
    repo = "flask-security";
    tag = finalAttrs.version;
    hash = "sha256-OloTftY73PNicJ7o+cBYo9EobrLoaxF78+KAoftJocI=";
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
      nh3
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
  };
})
