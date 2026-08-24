{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  python,
  setuptools,
  dbus,
}:

buildPythonPackage rec {
  pname = "dbus-next";
  version = "0.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "altdesktop";
    repo = "python-dbus-next";
    tag = "v${version}";
    hash = "sha256-EKEQZFRUe+E65Z6DNCJFL5uCI5kbXrN7Tzd4O0X5Cqo=";
  };

  build-system = [ setuptools ];

  # test_peer_interface hits a timeout
  # test_tcp_connection_with_forwarding fails due to dbus
  # creating unix socket anyway on v1.14.4
  meta = {
    description = "Zero-dependency DBus library for Python with asyncio support";
    homepage = "https://github.com/altdesktop/python-dbus-next";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
