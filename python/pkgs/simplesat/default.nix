{ lib
, attrs
, buildPythonPackage
, fetchFromGitHub
, okonomiyaki
, setuptools
, six
,
}:

buildPythonPackage rec {
  pname = "simplesat";
  version = "0.9.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "enthought";
    repo = "sat-solver";
    tag = "v${version}";
    hash = "sha256-C3AQN999iuckaY9I0RTI8Uj6hrV4UB1XYvua5VG8hHw=";
  };

  postPatch = ''
    substituteInPlace setup.cfg \
      --replace-fail "version = file: VERSION" "version = ${version}"
  '';

  build-system = [ setuptools ];

  dependencies = [
    attrs
    okonomiyaki
    six
  ];

  pythonImportsCheck = [ "simplesat" ];

  meta = {
    description = "Prototype for SAT-based dependency handling";
    homepage = "https://github.com/enthought/sat-solver";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
