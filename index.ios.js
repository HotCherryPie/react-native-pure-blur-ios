import React from 'react';
import PropTypes from 'prop-types';
import { View, requireNativeComponent } from 'react-native';

const XBlurView = requireNativeComponent('XBlurView');

const EffectsViewComponent = ({ children, vibrantContent, ...props }) => (
  <XBlurView
    {...props}
    vibrant={!!vibrantContent}
    // tintColor={processColor(tintColor)}
  >
    {vibrantContent || <View />}
    {children}
  </XBlurView>
);

EffectsViewComponent.propTypes = {
  vibrantContent: PropTypes.node,
  vibrantStyle: PropTypes.oneOf(['light', 'xlight', 'dark']),
  blurRadius: PropTypes.number,
  // tintColor: PropTypes.string,
};

EffectsViewComponent.defaultProps = {
  vibrantContent: undefined,
  vibrantStyle: 'light',
  blurRadius: 0,
  // tintColor: 'transparent',
};

export default EffectsViewComponent;
