#include "About.hpp"

#include "Config.hpp"

namespace fsp1 {
QString About::organization() const {
	return fsp1::Config::organization;
}

QString About::copyright() const {
	return fsp1::Config::copyright;
}

QString About::year() const {
	return fsp1::Config::year;
}

QString About::name() const {
	return fsp1::Config::name;
}

QString About::version() const {
	return fsp1::Config::version;
}

QString About::github() const {
	return fsp1::Config::github;
}

QString About::discord() const {
	return fsp1::Config::discord;
}

QString About::twitter() const {
	return fsp1::Config::twitter;
}
} // namespace fse
