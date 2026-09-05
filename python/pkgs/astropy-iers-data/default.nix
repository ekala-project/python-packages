{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage (finalAttrs: {
  pname = "astropy-iers-data";
  version = "0.2026.8.31.0.57.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "astropy";
    repo = "astropy-iers-data";
    tag = "v${finalAttrs.version}";
    hash = "sha256-VKVGjp3iM6RhTUVnpMK1XpIUhsUcLM8J55EAsYKJwC4=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "astropy_iers_data" ];

  # no tests
  doCheck = false;

  meta = {
    description = "IERS data maintained by @astrofrog and astropy.utils.iers maintainers";
    homepage = "https://github.com/astropy/astropy-iers-data";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
