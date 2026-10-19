{
  fetchFromGitHub,
  # build-system
  setuptools,
  buildPythonPackage,
  lib,
}:

buildPythonPackage rec {
  pname = "pa-ringbuffer";
  version = "0.1.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "spatialaudio";
    repo = "python-pa-ringbuffer";
    tag = version;
    sha256 = "1d4k6z13mc1f88m6wbhfx8hillb7q78n33ws5bmyblsdkv1gx607";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Adds ring buffer functionality";
    homepage = "https://github.com/spatialaudio/python-pa-ringbuffer";
    license = lib.licenses.mit;
  };
}
