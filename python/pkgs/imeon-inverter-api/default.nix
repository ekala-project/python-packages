{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  aiohttp,
}:

buildPythonPackage rec {
  pname = "imeon-inverter-api";
  version = "0.4.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Imeon-Inverters-for-Home-Assistant";
    repo = "inverter-api";
    tag = version;
    hash = "sha256-8W14q9Q+DcAHI1EiAmkodX6FfMYlD+nuiiY6NyOXI/o=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["pdm-backend"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "pdm.backend"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [ setuptools ];

  pythonRemoveDeps = [
    # https://github.com/Imeon-Inverters-for-Home-Assistant/inverter-api/pull/1
    "async-timeout"
  ];

  dependencies = [
    aiohttp
  ];

  pythonImportsCheck = [ "imeon_inverter_api" ];

  # upstream has no tests
  doCheck = false;

  meta = {
    description = "Standalone API to collect data from the Imeon Energy Inverters that uses HTTP POST/GET";
    homepage = "https://github.com/Imeon-Inverters-for-Home-Assistant/inverter-api";
    license = lib.licenses.asl20;
  };
}
