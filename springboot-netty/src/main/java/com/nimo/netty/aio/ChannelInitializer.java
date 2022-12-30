package com.nimo.netty.aio;

import com.nimo.netty.aio.server.AioServer;

import java.nio.channels.AsynchronousSocketChannel;
import java.nio.channels.CompletionHandler;

/**
 * @author : chuf
 * @date : 2022-12-22
 **/
public abstract class ChannelInitializer implements CompletionHandler<AsynchronousSocketChannel, AioServer> {

    @Override
    public void completed(AsynchronousSocketChannel channel, AioServer attachment) {
        try {
            initChannel(channel);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 再此接收客户端连接
            attachment.serverSocketChannel().accept(attachment, this);
        }
    }

    @Override
    public void failed(Throwable exc, AioServer attachment) {
        exc.getStackTrace();
    }

    protected abstract void initChannel(AsynchronousSocketChannel channel) throws Exception;

}
