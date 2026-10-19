{
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  lib,
  unstableGitUpdater,
}:

buildPythonPackage {
  pname = "senf";
  version = "1.5.1-unstable-2026-03-20";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "quodlibet";
    repo = "senf";
    rev = "fab3fe68dfc384a80accd1e6aec5e22db9db62cf";
    hash = "sha256-j4vhr9cWG2O0oOYbarJbNpEpcz5yqGJA56/e0NTgmjI=";
  };

  build-system = [ setuptools ];

  passthru.updateScript = unstableGitUpdater {
    tagPrefix = "v";
  };

  pythonImportsCheck = [ "senf" ];

  meta = {
    description = "Consistent filename handling for all Python versions and platforms";
    homepage = "https://senf.readthedocs.io/en/latest/";
    license = lib.licenses.mit;
  };

}
