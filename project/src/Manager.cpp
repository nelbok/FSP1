#include "Manager.hpp"

namespace fsp1 {

struct Manager::Impl {
	About about;
};

Manager::Manager(QObject* parent)
	: QObject(parent)
	, _impl{ std::make_unique<Impl>() } {}

Manager::~Manager() {
	reset();
}

void Manager::init() {
	reset();
}

void Manager::reset() {}

const About& Manager::about() const {
	return _impl->about;
}
} // namespace fsp1
