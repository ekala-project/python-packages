{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  bash,
  coreutils,
  debtcollector,
  fasteners,
  oslo-config,
  oslo-i18n,
  oslo-utils,
  pbr,
  setuptools,
}:

buildPythonPackage rec {
  pname = "oslo-concurrency";
  version = "7.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "openstack";
    repo = "oslo.concurrency";
    tag = version;
    hash = "sha256-NZ6OsaDwqEsW2FZEi8cjXkLa7EwVqt3mYPRkG/jGiFM=";
  };

  postPatch = ''
    substituteInPlace oslo_concurrency/tests/unit/test_processutils.py \
      --replace-fail "/usr" "" \
      --replace-fail "/bin/bash" "${bash}/bin/bash" \
      --replace-fail "/bin/true" "${coreutils}/bin/true" \
      --replace-fail "/bin/env" "${coreutils}/bin/env"

    substituteInPlace pyproject.toml \
      --replace-fail '"oslo_concurrency"' '"oslo_concurrency", "oslo_concurrency.fixture", "oslo_concurrency.tests"'
  '';

  env.PBR_VERSION = version;

  build-system = [ setuptools ];

  dependencies = [
    debtcollector
    fasteners
    oslo-config
    oslo-i18n
    oslo-utils
    pbr
  ];

  pythonImportsCheck = [ "oslo_concurrency" ];

  meta = {
    description = "Oslo Concurrency library";
    mainProgram = "lockutils-wrapper";
    homepage = "https://github.com/openstack/oslo.concurrency";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
