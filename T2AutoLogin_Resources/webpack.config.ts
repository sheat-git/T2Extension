import CopyPlugin from 'copy-webpack-plugin'
import HtmlWebpackPlugin from 'html-webpack-plugin'
import { Configuration } from 'webpack'

const config: Configuration = {
  mode: (process.env.NODE_ENV ?? 'development') as Configuration['mode'],
  entry: {
    popup: './src/popup.tsx',
    authenticate: './src/authenticate.tsx',
    redirect: './src/redirect.ts',
    background: './src/background.ts',
  },
  output: {
    path: `${__dirname}/../T2Extension/Extensions/T2AutoLogin/Resources`,
    publicPath: './',
    filename: 'js/[name].js',
    clean: true,
  },
  module: {
    rules: [
      {
        test: /.tsx?$/,
        use: 'ts-loader',
      },
    ],
  },
  resolve: {
    extensions: ['.ts', '.js', '.tsx'],
  },
  plugins: [
    new CopyPlugin({
      patterns: [
        {
          from: '.',
          to: '.',
          context: 'public',
        },
      ],
    }),
    new HtmlWebpackPlugin({
      template: './src/index.html',
      chunks: ['popup'],
      title: 'T2Extension',
      filename: 'popup.html',
    }),
  ],
  devtool: process.env.NODE_ENV === 'production' ? false : 'cheap-source-map',
  cache: false,
}

export default config
