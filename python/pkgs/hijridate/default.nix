{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-fancy-pypi-readme,
}:

buildPythonPackage rec {
  pname = "hijridate";
  version = "2.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dralshehri";
    repo = "hijridate";
    tag = "v${version}";
    hash = "sha256-xnFF81l1ZqtH91NzYvjzXpXpN/zeHdARJYx6L5VNBSo=";
  };

  build-system = [
    hatchling
    hatch-fancy-pypi-readme
  ];
  pythonImportsCheck = [ "hijridate" ];

  meta = {
    description = "Accurate Hijri-Gregorian date converter based on the Umm al-Qura calendar";
    homepage = "https://github.com/dralshehri/hijridate";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
