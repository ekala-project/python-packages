{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage {
  pname = "timeslot";
  version = "0.1.2";

  # pypi distribution doesn't include tests, so build from source instead
  src = fetchFromGitHub {
    owner = "ErikBjare";
    repo = "timeslot";
    rev = "af35445e96cbb2f3fb671a75aac6aa93e4e7e7a6";
    sha256 = "sha256-GEhg2iMsYMfalT7L9TCd1KHU6oa/wTl5m3mRC0zOH9Q=";
  };

  pyproject = true;

  nativeBuildInputs = [ poetry-core ];

  pythonImportsCheck = [ "timeslot" ];

  meta = {
    description = "Data type for representing time slots with a start and end";
    homepage = "https://github.com/ErikBjare/timeslot";
    maintainers = [ ];
    license = lib.licenses.mit;
  };
}
