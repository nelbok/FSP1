#pragma once

#include <QtCore/QObject>

#include "tools/About.hpp"

namespace fsp1 {

class Manager : public QObject {
	Q_OBJECT
	Q_PROPERTY(const About& about READ about CONSTANT)

public:
	Manager(QObject* parent = nullptr);
	virtual ~Manager();

	void init();

	Q_INVOKABLE void reset();

	const About& about() const;

private:
	struct Impl;
	std::unique_ptr<Impl> _impl;
};
} // namespace fsp1
