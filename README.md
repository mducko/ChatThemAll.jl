# ChatThemAll

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://Azzaare.github.io/ChatThemAll.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://Azzaare.github.io/ChatThemAll.jl/dev/)
[![Build Status](https://github.com/Azzaare/ChatThemAll.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/Azzaare/ChatThemAll.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/Azzaare/ChatThemAll.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/Azzaare/ChatThemAll.jl)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)
[![PkgEval](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/C/ChatThemAll.svg)](https://JuliaCI.github.io/NanosoldierReports/pkgeval_badges/report.html)

ChatThemAll.jl is a powerful and versatile chatbot framework for Julia, designed to provide a unified interface for chatbots operating on various messaging platforms such as Mattermost, Slack, Line, Zulip, and Discord. By offering a streamlined API for developers, the package simplifies the process of building and deploying chatbots that can interact with multiple platforms simultaneously, effectively bridging the gap between different chat services.

In addition to enabling cross-platform communication, ChatThemAll.jl incorporates a shared database to manage and synchronize information across all connected platforms. This feature allows chatbots to maintain a consistent knowledge base and ensure accurate, up-to-date responses regardless of the platform being used. The package's aggregator functionality further enhances the chatbot experience, empowering users to selectively communicate with one or multiple platforms at the same time. ChatThemAll.jl is the ultimate solution for developers seeking a comprehensive, easy-to-use framework for creating versatile and platform-agnostic chatbots in Julia.

## Bots, hubs, and modules

The basic structures of `ChatThemAll` are bots, hubs, and modules. A bot is a single chatbot that can be connected to usually one platforms. A hub is a collection of bots. Both bots and hubs have collections of modules.

A module can be of three kinds

- Listening modules: These modules listen to messages (webhooks) usually sent from the chat platforms. They can be used to respond to messages, or to perform other tasks.
- Monitoring modules: These modules monitor the state of the chat platforms. They can be used to respond to events, or to perform other tasks such as moderation or analysis.
- Executing modules: These modules are executed periodically or through a direct request from the bot administrator. They can be used to perform tasks such as data collection, analysis, periodic reporting, or other tasks.

When a hub or a bot starts, it loads all its modules (in the order they're provided). In the case of the hub, it also starts all the bots it contains once all the modules are started.

Note that some modules might be marked as `blocking`, which means that they will block the execution of the hub or the bot until they finish loading. This is useful for cross modules or cross bots dependencies.
