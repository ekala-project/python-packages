{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  python,
  hatch-vcs,
  hatchling,
  gettext,
}:

buildPythonPackage rec {
  pname = "humanize";
  version = "4.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-humanize";
    repo = "humanize";
    tag = version;
    hash = "sha256-Ht4lK+Qd6pU4i6MUycaT3j69ldkTRtQ21QzKuLGgrLY=";
  };

  nativeBuildInputs = [
    hatch-vcs
    hatchling
    gettext
  ];

  postBuild = ''
    scripts/generate-translation-binaries.sh
  '';

  postInstall = ''
    cp -r 'src/humanize/locale' "$out/${python.sitePackages}/humanize/"
  '';

  pythonImportsCheck = [ "humanize" ];

  meta = {
    description = "Python humanize utilities";
    homepage = "https://github.com/python-humanize/humanize";
    license = lib.licenses.mit;
  };
}
