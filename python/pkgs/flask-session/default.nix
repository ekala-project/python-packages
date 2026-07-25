{
  lib,
  stdenv,
  fetchFromGitHub,
  buildPythonPackage,

  # build-system
  flit-core,

  # dependencies
  flask,
  cachelib,
  msgspec,
}:

buildPythonPackage rec {
  pname = "flask-session";
  version = "0.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pallets-eco";
    repo = "flask-session";
    tag = version;
    hash = "sha256-QLtsM0MFgZbuLJPLc5/mUwyYc3bYxildNKNxOF8Z/3Y=";
  };

  build-system = [ flit-core ];

  dependencies = [
    cachelib
    flask
    msgspec
  ];
  pythonImportsCheck = [ "flask_session" ];
  # Hang indefinitely
  doCheck = !(stdenv.hostPlatform.isDarwin && stdenv.hostPlatform.isx86_64);

  meta = {
    description = "Flask extension that adds support for server-side sessions";
    homepage = "https://github.com/pallets-eco/flask-session";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
